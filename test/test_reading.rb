
require 'test/unit'
require 'id3lib'


class TestReading < Test::Unit::TestCase

  def setup
    @tag = ID3Lib::Tag.new('test/data/sample.mp3')
  end

  def test_array
    assert_equal 'Dummy Title',     @tag[0][:text]
    assert_equal 'Dummy Artist',    @tag[1][:text]
    assert_equal 'Dummy Album',     @tag[2][:text]
    assert_equal '1/10',            @tag[3][:text]
    assert_equal '2000',            @tag[4][:text]
    assert_equal 'Dummy Comment',   @tag[5][:text]
    assert_equal 'Dummy Comment 2', @tag[6][:text]
    assert_equal 'Pop',             @tag[7][:text]
  end

  def test_direct_access
    assert_equal 'Dummy Title',   @tag.title
    assert_equal 'Dummy Artist',  @tag.artist
    assert_equal 'Dummy Artist',  @tag.performer
    assert_equal 'Dummy Album',   @tag.album
    assert_equal '1/10',          @tag.track
    assert_equal '2000',          @tag.year
    assert_equal 'Dummy Comment', @tag.comment
    assert_equal 'Pop',           @tag.genre
  end

  def test_frame_text
    assert_equal 'Dummy Title',   @tag.frame_text(:TIT2)
    assert_equal 'Dummy Artist',  @tag.frame_text(:TPE1)
    assert_equal 'Dummy Album',   @tag.frame_text(:TALB)
    assert_equal '1/10',          @tag.frame_text(:TRCK)
    assert_equal '2000',          @tag.frame_text(:TYER)
    assert_equal 'Dummy Comment', @tag.frame_text(:COMM)
    assert_equal 'Pop',           @tag.frame_text(:TCON)
    assert_equal nil,             @tag.frame_text(:AENC)
  end

  def test_user_frame_text
    album_id = @tag.user_frame_text('MusicBrainz Album Id')
    assert_equal '992dc19a-5631-40f5-b252-fbfedbc328a9', album_id
    assert_equal nil, @tag.user_frame_text('Inexistent')
  end

  def test_comments
    one, two = @tag.comment_frames
    assert_not_nil one
    assert_not_nil two
    assert_equal 'Dummy Comment',   one[:text]
    assert_equal 'Dummy Comment 2', two[:text]
  end

  def test_has_tag
    assert @tag.has_tag?(ID3Lib::V1)
    assert @tag.has_tag?(ID3Lib::V2)
  end

  def test_size
    assert_equal 2038, @tag.size
  end

  def test_invalid_frames
    assert_nil @tag.invalid_frames

    @tag << { :id => :TITS }
    assert_equal [[:TITS]], @tag.invalid_frames

    @tag << { :id => :TALB, :invalid => 'text' }
    assert_equal [[:TITS], [:TALB, :invalid]], @tag.invalid_frames

    @tag << { :id => :APIC, :text => 'invalid' }
    assert_equal [[:TITS], [:TALB, :invalid], [:APIC, :text]],
      @tag.invalid_frames
  end

end

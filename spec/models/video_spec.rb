require 'rails_helper'

describe Video do
  before(:each) do
    @video = Video.new(url: "https://www.youtube.com/watch?v=-lJz8xdZQu4")
  end

  let(:video) { Video.new }

  describe "#new" do
    it "creates a video object" do
      expect(@video).to be_a Video
    end
  end

  describe "#get_video_info" do
    it "sets a video's title, embed code, and thumbnail" do
      @video.get_video_info
      expect(@video.title).to eq "Barenaked Ladies - Testing 1, 2, 3 (Video)"
      expect(@video.thumbnail).to eq 'https://i.ytimg.com/vi/-lJz8xdZQu4/mqdefault.jpg'
      expect(@video.embed_code).not_to be nil
    end

    it "makes the video valid" do
      @video.get_video_info
      expect(@video.valid?).to be true
    end

    it "raises an exception if given an invalid url" do
      bad_video = Video.new(url: "https://www.youtube.com/asddas")
      expect{ bad_video.get_video_info }.to raise_error(VideoInfo::UrlError)
      expect(bad_video.valid?).to be false
    end
  end
end
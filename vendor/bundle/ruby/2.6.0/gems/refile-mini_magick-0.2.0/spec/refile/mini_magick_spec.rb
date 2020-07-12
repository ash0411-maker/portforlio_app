require "pry"
require "refile/mini_magick"
require "phashion"

["ImageMagick", "GraphicsMagick"].each do |cli|
  RSpec.context "With #{cli}", cli: cli.downcase.to_sym do
    describe Refile::MiniMagick do
      let(:portrait) { Tempfile.new(["portrait", ".jpg"]) }
      let(:landscape) { Tempfile.new(["landscape", ".jpg"]) }

      matcher :be_similar_to do |expected|
        match do |actual|
          a = Phashion::Image.new(expected)
          b = Phashion::Image.new(actual)
          @distance = a.distance_from(b).abs
          @distance < allowed_distance
        end

        failure_message do
          "perceptual hash distance between images should be < #{allowed_distance} but was #{@distance}"
        end

        def allowed_distance
          2
        end
      end

      def fixture_path(name)
        File.expand_path("./fixtures/#{name}", File.dirname(__FILE__))
      end

      around do |example|
        MiniMagick.with_cli(example.metadata[:cli]) { example.run }
      end

      before do
        FileUtils.cp(fixture_path("portrait.jpg"), portrait.path)
        FileUtils.cp(fixture_path("landscape.jpg"), landscape.path)
      end

      describe "#convert" do
        it "changes the image format" do
          file = Refile::MiniMagick.new(:convert).call(portrait, "png")
          expect(::MiniMagick::Image.new(file.path).identify).to match(/PNG/)
        end

        it "yields the command object" do
          expect { |b| Refile::MiniMagick.new(:convert).call(portrait, "png", &b) }
            .to yield_with_args(MiniMagick::Tool)
        end
      end

      describe "#limit" do
        it "resizes the image up to a given limit" do
          file = Refile::MiniMagick.new(:limit).call(portrait, "400", "400")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(300)
          expect(result.height).to eq(400)
        end

        it "does not resize the image if it is smaller than the limit" do
          file = Refile::MiniMagick.new(:limit).call(portrait, "1000", "1000")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(600)
          expect(result.height).to eq(800)
        end

        it "produces correct image" do
          file = Refile::MiniMagick.new(:limit).call(portrait, "400", "400")
          expect(file.path).to be_similar_to(fixture_path("limit.jpg"))
        end

        it "yields the command object" do
          expect { |b| Refile::MiniMagick.new(:limit).call(portrait, "400", "400", &b) }
            .to yield_with_args(MiniMagick::Tool)
        end
      end

      describe "#fit" do
        it "resizes the image to fit given dimensions" do
          file = Refile::MiniMagick.new(:fit).call(portrait, "400", "400")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(300)
          expect(result.height).to eq(400)
        end

        it "enlarges image if it is smaller than given dimensions" do
          file = Refile::MiniMagick.new(:fit).call(portrait, "1000", "1000")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(750)
          expect(result.height).to eq(1000)
        end

        it "produces correct image" do
          file = Refile::MiniMagick.new(:fit).call(portrait, "400", "400")
          expect(file.path).to be_similar_to(fixture_path("fit.jpg"))
        end

        it "yields the command object" do
          expect { |b| Refile::MiniMagick.new(:fit).call(portrait, "400", "400", &b) }
            .to yield_with_args(MiniMagick::Tool)
        end
      end

      describe "#fill" do
        it "resizes and crops the image to fill out the given dimensions" do
          file = Refile::MiniMagick.new(:fill).call(portrait, "400", "400")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(400)
          expect(result.height).to eq(400)
        end

        it "enlarges image and crops it if it is smaller than given dimensions" do
          file = Refile::MiniMagick.new(:fill).call(portrait, "1000", "1000")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(1000)
          expect(result.height).to eq(1000)
        end

        it "produces correct image" do
          file = Refile::MiniMagick.new(:fill).call(portrait, "400", "400")
          expect(file.path).to be_similar_to(fixture_path("fill.jpg"))
        end

        it "yields the command object" do
          expect { |b| Refile::MiniMagick.new(:fill).call(portrait, "400", "400", &b) }
            .to yield_with_args(MiniMagick::Tool)
        end
      end

      describe "#pad" do
        it "resizes and fills out the remaining space to fill out the given dimensions" do
          file = Refile::MiniMagick.new(:pad).call(portrait, "400", "400", "red")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(400)
          expect(result.height).to eq(400)
        end

        it "enlarges image and fills out the remaining space to fill out the given dimensions" do
          file = Refile::MiniMagick.new(:pad).call(portrait, "1000", "1000", "red")
          result = ::MiniMagick::Image.new(file.path)
          expect(result.width).to eq(1000)
          expect(result.height).to eq(1000)
        end

        it "produces correct image" do
          file = Refile::MiniMagick.new(:pad).call(portrait, "400", "400")
          expect(file.path).to be_similar_to(fixture_path("pad.jpg"))
        end

        it "yields the command object" do
          expect { |b| Refile::MiniMagick.new(:pad).call(portrait, "400", "400", &b) }
            .to yield_with_args(MiniMagick::Tool)
        end
      end
    end
  end
end

require "google/cloud/vision"
class GoogleVisionService

  def self.analyze(image)
    client = Google::Cloud::Vision.new(project: ENV["GOOGLE_CLOUD_PROJECT"])

    response = client.image(image)

    document = response.document
  end

end

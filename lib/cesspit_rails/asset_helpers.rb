module CesspitRails
  module AssetHelpers
    # Raised when an asset is not found.
    class AssetNotFound < StandardError
      attr_accessor :path
    
      def initialize(path)
        @path = path
        super "Asset not found #{path.inspect}"
      end
    end
    
    def add_asset(path)
      asset = assets[path]
      raise AssetNotFound, path unless asset
    
      add_css(asset.to_s, path)
    end
  
    # Override the default read_html method.
    def read_css(path)
      add_asset(path)
    rescue AssetNotFound => ex
      super(path)
    end
  
    def assets
      Rails.application.assets
    end
  end
end

Cesspit.send :prepend, CesspitRails::AssetHelpers
module Feed
  module Storage
    class FileSystem
      def initialize(storage_path)
        @storage_path = storage_path
      end
    end
  end
end

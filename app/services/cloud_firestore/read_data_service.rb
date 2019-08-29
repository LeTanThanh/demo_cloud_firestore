module CloudFirestore
  class ReadDataService
    def initialize
      @firestore = Google::Cloud::Firestore.new
    end

    def perform
      users = firestore.col "users"
      users.get do |user|
        puts "#{"document_id".ljust 20}: #{user.document_id}"
        puts "#{"data".ljust 20}: #{user.data}"
        puts "--------------------------------------------------------------------------------------\n\n"
      end
    end

    private
    attr_reader :firestore
  end
end

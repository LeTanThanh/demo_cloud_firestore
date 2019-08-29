module CloudFirestore
  class AddDataService
    def initialize
      @firestore = Google::Cloud::Firestore.new
    end

    def perform
      user = {
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        email: FFaker::Internet.email,
        age: (10..30).to_a.sample
      }

      doc = firestore.doc "users/#{uuid}_#{full_name user}"
      doc.set(
        first_name: user[:first_name],
        last_name: user[:last_name],
        email: user[:email],
        age: user[:age]
      )
    end

    private
    attr_reader :firestore

    def full_name user
      user.slice(:first_name, :last_name).values.map(&:downcase).join("_")
    end

    def uuid
      "#{Time.current.to_i}_#{rand 1000}"
    end
  end
end

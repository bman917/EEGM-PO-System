module ActiveRecord
    class Base
      def generic_cache_key(association)
        count = association.count
        max_updated_at =  association.maximum(:updated_at).try(:utc).try(:to_s, :number)
          "#{count}_#{max_updated_at}"
    end
  end
end
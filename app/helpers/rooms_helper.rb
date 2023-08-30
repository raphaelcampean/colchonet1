module RoomsHelper
    def belongs_to_user(room)
        user_signed_in? && room.user == current_user
    end

    def error_tag(model, attribute)
        
        if model.errors.has_key? attribute
        content_tag(
        :div,
        model.errors[attribute].first,
        class: 'error_message'
        )
        end
    end
end

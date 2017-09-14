module PeopleHelper
    def avatar_for(person, options = { size: 80 })
        size = options[:size]
        if person.avatar?
            if size <= 80
                image_tag person.avatar.url(:thumb), width: size, height: size, alt: person.first_name, class: 'avatar-image'
            else
                image_tag person.avatar.url, width: size, height: size, alt: person.first_name, class: 'avatar-image'
            end
        else
            image_tag "no-user-image.jpg", width: size, class: "avatar-image"
        end
    end
end

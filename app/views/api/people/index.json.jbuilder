json.next_page @vitaes.next_page
json.vitaes do |json|
    json.array! @vitaes do |cv|
        json.id cv.id
        json.first_name cv.first_name
        json.last_name cv.last_name
        json.resume_status cv.resume_status
        json.education_status cv.education_status
    end
end





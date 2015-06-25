json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :job_title, :hire_date, :company_id, :location_id
  json.url employee_url(employee, format: :json)
end

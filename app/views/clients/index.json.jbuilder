json.array!(@clients) do |client|
  json.extract! client, :id, :logo, :company_name, :email, :phone_number, :vat_id, :contact_person, :visible
  json.url client_url(client, format: :json)
end

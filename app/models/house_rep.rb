class HouseRep < ApplicationRecord
  def as_representative
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      gender: gender,
      dob: dob,
      party: party,
      phone: phone,
      website_url: website_url,
      contact_form_url: contact_form_url,
      facebook_account: facebook_account,
      twitter_account: twitter_account,
      reelection_year: reelection_year
    }
  end

  def parse_propublica_result(res)
    m = HouseRep.new
    m.propublica_id = r['id']
    m.first_name = r['first_name']
    m.middle_name = r['middle_name']
    m.last_name = r['last_name']
    m.party = r['party']
    m.dob = r['date_of_birth']
    m.phone = r['phone']
    m.contact_form_url = r['contact_form']
    m.website_url = r['url']
    m.twitter_account = r['twitter_account']
    m.facebook_account = r['facebook_account']
    m.in_office = r['in_office']
    m
  end
end

RSpec.shared_examples :record_not_found do |params = { klass: nil } |
  it 'responds message HTTP_MESSAGE_RECORDNOTFOUND with http status 404' do
    expect(response).to have_http_status(404)
    expect(response.body).to eq(
      { status: 404, message: exception_message(params[:klass]), data: nil }.to_json
    )
  end

  def exception_message(klass)
    ActiveRecord::Relation.new(klass).raise_record_not_found_exception!
  rescue ActiveRecord::RecordNotFound => e
    e.message
  end
end

require 'rails_helper'
require 'requests/shared_examples/record_not_found_example'

RSpec.describe 'API::V1::Courses', type: :request do
  describe 'GET /api/v1/courses' do
    it 'renders a successful response' do
      course = create(:course)
      get api_v1_courses_url, as: :json
      expect(response).to be_successful
      expect(response.body).to eq([course].to_json)
    end
  end

  describe 'GET /api/v1/courses/:slug' do
    context 'record can not be found with given params[:slug]' do
      before { get api_v1_course_url('nonexistent_slug'), as: :json }
      include_examples(:record_not_found, klass: Course)
    end

    context 'course can be found with given params[:slug]' do
      it 'renders a successful response' do
        course = create(:course)
        get api_v1_course_url(course), as: :json
        expect(response).to be_successful
        expect(response.body).to eq(course.to_json)
      end
    end
  end

  describe 'POST /api/v1/courses' do
    context 'with valid parameters' do
      it 'renders a JSON response with the new course' do
        attributes = attributes_for(:course).merge(sections_attributes: [attributes_for(:section)])
        expect do
          post api_v1_courses_url,
               params: { course: attributes }, as: :json
        end.to change(Course, :count).by(1)
           .and change(Section, :count).by(1)
        expect(response).to have_http_status(201)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Course and responds error message with http status 422' do
        course = build(:course)
        allow(Course).to receive(:new).and_return(course)
        allow(course).to receive(:save!).and_raise(ActiveRecord::RecordInvalid)
        expect do
          post api_v1_courses_url,
               params: { course: { attributes: 'invalid' } }, as: :json
        end.not_to change(Course, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to eq({
          status: 422, message: ApplicationController::HTTP_MESSAGE_UNPROCESSABLEENTITY, data: nil
        }.to_json)
      end
    end
  end

  describe 'PATCH api/v1/courses/:slug' do
    context 'record can not be found with given params[:slug]' do
      before { patch api_v1_course_url('nonexistent_slug'), as: :json }
      include_examples(:record_not_found, klass: Course)
    end

    context 'with valid parameters' do
      it 'updates the requested course and responds with http status 200' do
        course = create(:course)
        attributes = attributes_for(:course).merge(sections_attributes: [attributes_for(:section)])
        patch api_v1_course_url(course), params: { course: attributes }, as: :json
        expect(response).to have_http_status(200)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(JSON.parse(response.body)).to eq(JSON.parse(course.reload.to_json))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested course and responds error message with http status 422' do
        course = create(:course)
        allow(Course).to receive(:find_by!).and_return(course)
        allow(course).to receive(:update!).and_raise(ActiveRecord::RecordInvalid)
        expect do
          patch api_v1_course_url(course), params: { course: { attributes: 'invalid' } }, as: :json
        end.not_to(change { course.updated_at })
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'record can not be found with given params[:slug]' do
      before { delete api_v1_course_url('nonexistent_slug'), as: :json }
      include_examples(:record_not_found, klass: Course)
    end

    it 'destroys the requested course' do
      course = create(:course)
      create(:section, course: course)
      expect { delete api_v1_course_url(course), as: :json }
        .to change(Course, :count).by(-1)
        .and change(Section, :count).by(-1)
    end
  end
end

module Api
  module V1
    class AuthorsController < BaseController
      include Authors::Common
      # include Laws::Search

      load_and_authorize_resource :author, class: 'Author'

      # GET /v1/laws
      # POST /v1/laws
      # GET /v1/laws/:id
      # PATCH/PUT /v1/laws/:id
      # DELETE /v1/laws/:id
      %i[index create show update destroy].each do |action|
        send "add_#{action}_authors_action"
      end

      # # GET /v1/laws/search
      # def search
      #   search = law_search(search_params)
      #   @laws = search.results
      #   respond_with(@laws, each_serializer: LawSerializer, adapter: :json, root: :laws,
      #                meta: meta_attributes(@laws), sunspot_search: search)
      # end
      #
      # private
      #
      # def search_params
      #   params.permit(:reference_no, :short_title, :starts_on_from, :starts_on_to, :q, :per_page, :page)
      # end
    end
  end
end

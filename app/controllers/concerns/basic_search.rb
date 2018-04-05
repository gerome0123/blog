module BasicSearch
  extend ActiveSupport::Concern

  DEFAULT_OPTIONS = {
    paginate: {
      'page': 1,
      'per_page': 20
    },
    solr: {
      'q.op': 'AND',
      'mm': '100%',
      'hl': true,
      'hl.simple.pre': '@@@hl@@@',
      'hl.simple.post': '@@@endhl@@@',
      'hl.fragsize': 0,
      'hl.maxAnalyzedChars': -1,
      'hl.maxAlternateFieldLength': -1
    }
  }.with_indifferent_access.freeze

  def basic_search(search_instance, params = {}, opts = {})
    setup = search_instance.instance_variable_get('@setup')

    search_instance.build do |dsl|
      dsl.with :id, params[:id] if params[:id].present?

      search_sorting_for(setup, dsl, params[:sort_by])
      dsl.paginate paginate_options(params.slice(:page, :per_page))
      adjust_solr_params_for(setup, dsl, opts)
    end
    search_instance.execute
  end

  private

  def adjust_solr_params_for(setup, object, opts = {})
    fields = setup.all_text_fields.map(&:indexed_name).join(' ')
    options = search_options.deep_merge({ 'hl.fl': fields }.merge(opts))
    object.adjust_solr_params do |params|
      params.deep_merge!(search_options.deep_merge(options))
    end
    params.keep_if { |_key, value| value.present? }
  end

  def search_sorting_for(setup, object, sort = {})
    return unless sort.is_a?(ActionController::Parameters)

    sort.select { |k, v| %w[desc asc].include?(v) && setup.field(k.to_sym) }.each do |key, type|
      object.order_by key, type
    end
  end

  def paginate_options(opts)
    search_options[:paginate].merge(opts)
  end

  def search_options
    DEFAULT_OPTIONS.deep_merge(self.class._search_options || {})
  end

  module ClassMethods
    attr_accessor :_search_options

    def search_options(options)
      @_search_options ||= {}
      @_search_options.deep_merge!(options)
    end
  end
end

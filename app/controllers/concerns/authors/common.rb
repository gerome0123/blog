module Authors
  module Common
    extend ActiveSupport::Concern

    private

    def author_params
      params.permit(:fname, :lname, :age, :email)
    end

    def author_path
      api_author_path(@author)
    end

    class_methods do
      def add_index_authors_action
        define_method :index do
          respond_with(@authors)
        end
      end

      def add_create_authors_action
        define_method :create do
          @author.save
          respond_with(@author, location: -> { author_path })
        end
      end

      def add_show_authors_action
        define_method :show do
          respond_with(@author)
        end
      end

      def add_update_authors_action
        define_method :update do
          @author.update(author_params)
          respond_with(@author, location: -> { author_path })
        end
      end

      def add_destroy_authors_action
        define_method :destroy do
          @author.destroy
          respond_with(@author)
        end
      end
    end
  end
end

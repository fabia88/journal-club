class ImportNewPapersJob < ApplicationJob
  def perform
    ImportNewPapersService.new().call
  end
end

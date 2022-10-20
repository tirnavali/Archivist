class CollectionItemsController < ApplicationController
  def create
    collection_id = params[:collection_items][:collection_id]
    @record_metadatum_ids = params[:record_metadatum_ids]
    if @record_metadatum_ids.present?
      collection_items  = @record_metadatum_ids.map{ |data| {"collection_id" => collection_id, "record_metadatum_id" => data } }

      added = nil
      collection_items.each do |item|
        added = CollectionItem.find_or_create_by!(item)
      end

      respond_to do |format|
        if added.present?
          format.turbo_stream
          format.html { redirect_to :root, notice: t(:items_added_successfully)}
          format.json { render :show, status: :created, location: @fond }
        else
          format.html { render :root, status: :unprocessable_entity }
          format.json { render json: @fond.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.turbo_stream 
        format.html { redirect_to :root, notice: t(:items_added_successfully)}
      end
    end
  end
end

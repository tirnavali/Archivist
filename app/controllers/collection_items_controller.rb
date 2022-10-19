class CollectionItemsController < ApplicationController
  def create
    collection_id = params[:collection_items][:collection_id]
    record_metadatum_ids = params[:metadatum_ids]
    puts "i got thr requestt"
    
    collection_items  = record_metadatum_ids.map{ |data| {"collection_id" => collection_id, "record_metadatum_id" => data } }
    puts collection_items

    respond_to do |format|
      if CollectionItem.create!(collection_items)
        format.html { redirect_to :root, notice: t(:items_added_successfully)}
        format.json { render :show, status: :created, location: @fond }
      else
        format.html { render :root, status: :unprocessable_entity }
        format.json { render json: @fond.errors, status: :unprocessable_entity }
      end
    end
  end
end

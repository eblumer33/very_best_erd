class Api::V1::VeryBestsController < Api::V1::GraphitiController
  def index
    very_bests = VeryBestResource.all(params)
    respond_with(very_bests)
  end

  def show
    very_best = VeryBestResource.find(params)
    respond_with(very_best)
  end

  def create
    very_best = VeryBestResource.build(params)

    if very_best.save
      render jsonapi: very_best, status: 201
    else
      render jsonapi_errors: very_best
    end
  end

  def update
    very_best = VeryBestResource.find(params)

    if very_best.update_attributes
      render jsonapi: very_best
    else
      render jsonapi_errors: very_best
    end
  end

  def destroy
    very_best = VeryBestResource.find(params)

    if very_best.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: very_best
    end
  end
end

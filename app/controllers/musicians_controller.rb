class MusiciansController < ApplicationController
    has_many :compositions, dependent: :destroy
    # Other associations and model logic
  end

  def destroy
    musician = Musician.find(params[:id])

    # Reassign compositions to another musician (if desired)
    musician.compositions.update_all(musician_id: new_musician_id)

    # Or delete compositions associated with the musician
    musician.compositions.destroy_all

    # Then destroy the musician
    musician.destroy

    # Redirect or render success
    redirect_to musicians_path
  end
end

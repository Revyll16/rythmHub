class InstrumentsController < ApplicationController
  @instruments = Instrument.all
end

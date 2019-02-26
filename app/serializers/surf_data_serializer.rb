class SurfDataSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :location_name,
              :region_name,
              :timestamp,
              :wind,
              :conditions,
              :swell
end

module INE

using HTTP, JSONStat
using Dates

export INEdataset

function INEdataset(id::String; from::Date=Date(2010, 12))
    resp = HTTP.get("https://servicios.ine.es/wstempus/jsstat/ES/DATASET/" *
                    id *"?date=" * Dates.format(from, "Ymmdd") *":").body

    return JSONStat.read(resp)
end

INEdataset(id::Int; from::Date=Date(2010, 12)) = INEdataset(string(id); from)

function INEmetadata() end

end # module

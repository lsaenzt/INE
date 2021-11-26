module INE

using HTTP, JSON3, JSONStat
using Dates

export INEdataset

function INEdataset(id::String; from::Date=Date(2010, 12))
    resp = HTTP.get("https://servicios.ine.es/wstempus/jsstat/ES/DATASET/" *
                    id *"?date=" * Dates.format(from, "Ymmdd") *":").body

    js = JSON3.read(resp, JSONStat.Dataset)

    println(js.label, "\n", "")

    return JSONStat.datatable(js)
end

INEdataset(id::Int; from::Date=Date(2010, 12)) = INEdataset(string(id); from)

end # module

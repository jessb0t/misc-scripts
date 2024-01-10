%function to reverse file separators in a filepath
function flipped = flippath(pathin, oldsep, newsep)
    pathparts = split(pathin, oldsep);
    flipped = "";
    for x=1:length(pathparts)
        flipped = flipped + string(pathparts(x)) + newsep;
    end
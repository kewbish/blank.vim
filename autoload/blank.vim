function blank#Lint()
    echom "Blank-style linting..."
    let potFile = expand('%:r'). '-blank-diff.'. expand('%:e')
    if filereadable(potFile)
        echom "File exists. Exiting."
    else
        execute "w ". potFile
        execute "vsp ". potFile
        silent! call blank#Hi()
        for quirk in s:quirks
            if !(quirk == "ing")
                execute "%s/\<". quirk. "\>//ge"
            endif
        endfor
        echom "Blank issues linted out. Compare and rewrite as needed."
        write
    endif
endfunction

function blank#Diff()
    silent! call blank#Lint()
    diffthis
    wincmd p
    diffthis
    echom "Blank issues diffed."
endfunction

function blank#Hi()
    highlight Blank ctermfg=95 cterm=underline
    for quirk in s:quirks
        let quirkLen = len(split(quirk, " "))
        if quirkLen > 1 || quirk == "ing"
            execute "syntax match Blank /". quirk. "/"
        else
            execute "syntax keyword Blank ". quirk
        endif
    endfor
    echom "Blank issues highlighted..."
endfunction

let s:quirks = ["there is", "there are", "there was", "there were", "it is", "it was", "that is", "that are", "that were", "which is", "which are", "itself", "one", "as", "ing", "therefore", "however", "hence", "furthermore", "consequently", "thus", "indeed", "actually", "aspects", "basically", "certainly", "essentially", "generally", "overall", "quite", "really", "simply", "situation", "truly", "ultimately", "virtually", "very", "could", "should", "would", "a considerable amount of", "a lot of", "a majority of", "advance warning", " all of a sudden", "all of these", "along the lines of", "amongst", "are able to", "was able to", "were able to", "as a matter of fact", "as a means to", "as a whole", "as being a", "as it truly is", "as of the moment", "as the case may be", "at all times", "at first glance", "at the same time that", "at this point in time", "basic necessity", "basic fundamentals", "because of the fact that", "being", "both of the", "brings to mind", "by definition", "by means of", "by the use of", "by virtue of", "came to a realization", "came to an abrupt end", "can be seen as", "close scrutiny", "common similarities", "compare and contrast", "complete stranger", "completely eliminate", "concerning the matter of", "core essence", "despite the fact that", "did not succeed", "due to the", "during the course of", "each individual", "each of", "early on in the", "enter into", "erode away", "every single one", "final destination", "final outcome", "first and foremost", "for all intents and purposes", "for that which is", "for the purpose of", "foreseeable future", "free gift", "future plans", "future prospects", "general consensus", "hand-in-hand", "a tendency to", "been found to be", "the ability to", "capacity for", "the effect of", "the opportunity to", "i myself", "in a situation in which", "in a very real sense", "in actuality", "in all likelihood", "in all probability", "in close proximity", "in connection with", "in essence", "in light of the fact that", "in nature", "in order to", "in reality", "in reference to", "in spite of", "in terms of", "in the area of", "in the course of", "in the event that", "in the light of", "in the midst of", "in the nature of", "in the near future", "in which", "interestingly enough", "irregardless", "is able to", "is aware of the fact that", "is found to be", "is going to", "is in conflict with", "is in contrast to", "is of significant importance", "is scared of", "is seen as", "is when", "is where", "more or less", "it can be seen that", "it goes to show that", "it is clear that", "it is evident that", "it is apparent that", "it is crucial that", "it is important that", "it is necessary that", "gather together", "last but not least", "later on", "make a decision", "make an assumption", "make contact with", "make reference", "manner in which", "mental attitude", "mix together", "more or less", "more preferable", "mutual agreement", "natural instinct", "of great importance", "off of", "on a daily basis", "on account of the fact that", "on the basis of", "on the grounds that", "on the situation of", "one of the more", "one of the most interesting", "only serves to", "overall goal", "overall structure", "owing to the fact that", "particular type of", "past experience", "past history", "past memories", "period of time", "plan ahead", "prior to", "providing that", "quite clearly", "real truth", "real life", "regardless of the fact that", "respective", "right up to the", "serves to", "some kind of", "sort of", "take action", "take the time", "tragedy", "being said", "that exists", "that is", "that are", "that is to say", "the end result", "the final result", "the fact that", "the final conclusion", "the majority of", "the reason", "the type of", "the use ofhe whole", "the world we live in", "there is a chance that", "throughout the course of", "through the use of", "total abstinence", "total annihilation", "totally obvious", "true facts", "united as one", "until such time as", "utmost perfection", "valuable asset", "various different", "we are of the opinion that", "well aware of", "what is important is", "whether or not", "have been found to be", "which is", "who are", "who was", "who were", "with the exception of", "hand"]

local SavedSendChatMessage = SendChatMessage;

local characterReplacement = {}
characterReplacement['a'] = {7, 'a', 'á', 'à', 'â', 'ä', 'å', 'ª'}
characterReplacement['A'] = {6, 'A', 'Á','À','Â','Ä','Å'}
characterReplacement['c'] = {2, 'c', 'ç'}
characterReplacement['C'] = {2, 'C', 'Ç'}
characterReplacement['e'] = {5, 'e', 'é', 'è', 'ê', 'ë'}
characterReplacement['E'] = {6, 'E', 'É', 'È', 'Ê', 'Ë', '€'}
characterReplacement['f'] = {2, 'f', 'ƒ'}
characterReplacement['i'] = {5, 'i', 'í', 'ì', 'î', 'ï'}
characterReplacement['I'] = {5, 'I', 'Í', 'Ì', 'Î', 'Ï'}
characterReplacement['n'] = {2, 'n', 'ñ'}
characterReplacement['N'] = {2, 'N', 'Ñ'}
characterReplacement['o'] = {6, 'o', 'ó', 'ò', 'ô', 'ö', 'º'}
characterReplacement['O'] = {5, 'O', 'Ó', 'Ò', 'Ô', 'Ö'}
characterReplacement['u'] = {6, 'u', 'ú', 'ù', 'û', 'ü', 'µ'}
characterReplacement['U'] = {5, 'U', 'Ú', 'Ù', 'Û', 'Ü'}
characterReplacement['y'] = {3, 'y', 'ý', 'ÿ'}
characterReplacement['Y'] = {2, 'Y', 'Ý'}
characterReplacement['b'] = {2, 'b', 'ß'}
characterReplacement['B'] = {2, 'B', 'ß'}

function has_key(table, key)
    return table[key]~=nil
end

function Impress_Message(msg)
    local replacementString = ""
    msg:gsub(".", function(c)
        if has_key(characterReplacement, c) then 
            local numReplacementChars = characterReplacement[c][1]
            local chosenIndex = math.random(1, numReplacementChars) + 1
            replacementString = replacementString..characterReplacement[c][chosenIndex]
        else
            replacementString = replacementString..c
        end
    end)
    return replacementString
end

function Impresive_SendChatMessage(msg, system, language, channel)
	SavedSendChatMessage(Impress_Message(msg), system, language, channel);
end

SendChatMessage = Impresive_SendChatMessage;
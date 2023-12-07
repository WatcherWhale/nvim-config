local gen = require("gen")

gen.model = "codellama"

gen.prompts["Generate"] = {
    prompt = "Generate only code, no explanations for $input, use the format ```$filetype\n...\n```.",
    replace = true,
    extract = "```$filetype\n(.-)```",
}

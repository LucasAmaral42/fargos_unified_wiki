namespace :create_items_from_jsonl do
  task(start: :environment) do
    MODS = %w[calamity dragon_ball_terraria shadows_of_abaddon thorium]

    MODS.each do |mod|
      file_path = "#{Rails.root}/public/jsonl/#{mod}_info.jsonl"

      File.readlines(file_path).each do |line|
        json = JSON.parse(line.to_s)

        mod = json['mod'].split('_').map(&:capitalize).join(' ')

        next if Item.where(name: json['name'], mod: mod).present?

        image_url = json['image_link'].match(/(.+(\.png|\.gif))|.+/i)[1] || ''

        item = {
          name: json['name'],
          types: json['types'],
          description: json['description'],
          url: json['link'],
          image_url: image_url,
          mod: mod
        }

        Item.create(item)
      end
    end
  end
end

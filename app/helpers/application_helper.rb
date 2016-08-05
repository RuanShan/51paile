module ApplicationHelper

  def datetimepicker_field_value(datetime)
    unless datetime.blank?
      l(datetime, format: Spree.t('datetime_picker.format', default: '%Y/%m/%d %H:%M'))
    else
      nil
    end
  end

  def taxons_tree_by_ulli(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.leaf?
    content_tag :ul, class: ['list-group', (root_taxon.root? ? 'sf-menu sf-vertical' : '')] do
      taxons = root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'list-group-item active' : 'list-group-item'
        content_tag :li, class: 'list-item' do
          link_to(taxon.name, seo_url(taxon), class: css_class) + taxons_tree_by_ulli(taxon, current_taxon, max_level - 1)
        end
      end
      safe_join(taxons, "\n")
    end
  end

  def taxonomy_list( taxonomies )
    content_tag :ul, class: ['list-group', 'sf-menu sf-vertical'] do
      taxons = taxonomies.collect{ |taxonomy|
        taxon = taxonomy.root
        content_tag :li, class: 'list-item' do
          link_to(taxon.name, seo_url(taxon) )
        end
      }
      safe_join(taxons, "\n")
    end
  end

  def format_datetime(datetime)
      l(datetime, format: '%m月%d日 %H:%M') if datetime.present?
  end

  def format_time(datetime)
    l(datetime, format: '%H:%M') if datetime.present?
  end
end

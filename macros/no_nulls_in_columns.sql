--Macro created to check for null values in any dataset. This goes on each column and check for nulls
{% 
    {% macro no_nulls_in_columns(model) %}
        SELECT
            *
        FROM {{model}}
        WHERE 
            {% for col in adapter.get_columns_in_relation(model) -%}
                {{  col.column  }} IS NULL OR
            {% endfor %}
            FALSE
    {% endmacro %}
%}
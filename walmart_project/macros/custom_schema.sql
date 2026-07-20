{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

    {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

{% test positive_price(model, column_name) -%}

select *
from {{ model }}
where {{ column_name }} <= 0

{%- endtest %}
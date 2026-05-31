import plotly.express as px
import plotly.io as pio

pio.renderers.default = "browser"

fig = px.bar(
    hyperdf, 
    x='Name', 
    y='Count', 
    color='Name',
    title='Distribution of 85 Article Topics',
    labels={'Name': 'Topic', 'Count': 'Number of Articles'},
    template='plotly_white'
)

fig.update_xaxes(showticklabels=False, title_text='Topics (Hover for details or see Legend)')
fig.update_layout(
    legend=dict(
        font=dict(size=10),
        traceorder="normal"
    )
)

fig.show()

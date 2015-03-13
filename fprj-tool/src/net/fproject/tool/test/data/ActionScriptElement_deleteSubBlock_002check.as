private function locationFieldChangedImpl(g:Graph) : void {
	var node:Node = null;
	if(g)
	{
		for each (node in g.getNodesInternal())
		{
			this.OfNode(node,node.data);
			if(node is Subgraph)
			{
				this.locationFieldChangedImpl(Subgraph(node).graph);
			}
			if(node is Abc)
			{
				this.locationFieldChangedImpl(Subgraph(node).graph);
			}
		}
	}
	return;
}
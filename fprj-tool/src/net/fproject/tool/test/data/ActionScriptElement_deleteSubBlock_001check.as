private function locationFieldChangedImpl(g:Graph) : void {
	
	{
		for each (node in g.getNodesInternal())
		{
			this.bindPositionOfNode(node,node.data);
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
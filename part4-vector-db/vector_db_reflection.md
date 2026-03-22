## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts using natural language queries. Keyword search relies on exact word matching, which means it may fail to retrieve relevant sections if the wording in the document differs from the query. For example, a query like "What are the termination clauses?" may not return results if the document uses different phrases such as "contract cancellation terms" or "agreement end conditions."

In contrast, vector databases enable semantic search by capturing the meaning of text rather than just matching keywords. Using embeddings, both the query and the document content are converted into numerical vectors that represent their semantic meaning. This allows the system to find relevant sections even if the wording is different but the meaning is similar.

In this use case, the contracts can be broken into smaller chunks and converted into embeddings using a language model. These embeddings are then stored in a vector database. When a lawyer asks a question, the query is also converted into an embedding and compared against the stored vectors using similarity measures such as cosine similarity.

The vector database efficiently retrieves the most relevant sections of the contract based on meaning, not exact words. This significantly improves search accuracy and user experience. Therefore, vector databases play a critical role in enabling intelligent, context-aware search in large legal documents.

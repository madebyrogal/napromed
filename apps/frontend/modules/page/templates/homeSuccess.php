<div>
    <article>
        <header>
            <h1><?= $pageContext[0]->getTitle(); ?></h1>
        </header>
    </article>
    <section>
        <p><?= $pageContext[0]->getContext(ESC_RAW); ?></p>
    </section>
</div>
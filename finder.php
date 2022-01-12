<?php

return \StubsGenerator\Finder::create()
    ->in('source/wp-ultimo')
    ->notPath('dependencies')
    ->notPath('inc/action-scheduler')
    ->sortByName()
;
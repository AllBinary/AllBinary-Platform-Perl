# Generated Code Do Not Modify

package org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathsCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseBasicArrayListCache';

our $instance = 'org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathsCacheFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{maxConcurrentPaths} = 0;
    $self->{maxPaths} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathsCacheFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $maxConcurrentPaths, $maxPaths) = @_;
        if ($maxConcurrentPaths != $self->{maxConcurrentPaths}) {
            for (my $index = $maxConcurrentPaths; $index >= $self->{maxConcurrentPaths}; $index--) {
                $self->{list}->add('org::allbinary::util::BasicArrayListS'->new($maxPaths));
            }
            $self->{maxConcurrentPaths} = $maxConcurrentPaths;
        }
        $self->{maxPaths} = $maxPaths;
}


sub getPaths {
    my ($self) = @_;
        if ($self->{list}->size() > 0) {
            return $self->{list}->removeAt(0);
        } else {
            return 'org::allbinary::util::BasicArrayListS'->new($self->{maxPaths});
        }
}


sub release {
    my ($self, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            'org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathCacheFactory'->getInstance()->release($list->get($index));
        }
        $list->clear();
        $self->{list}->add($list);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::util::cache::BaseBasicArrayListCache;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathCacheFactory;

1;


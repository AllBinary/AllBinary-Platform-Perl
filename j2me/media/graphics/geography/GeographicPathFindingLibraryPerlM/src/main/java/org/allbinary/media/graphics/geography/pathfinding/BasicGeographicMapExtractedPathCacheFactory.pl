# Generated Code Do Not Modify

package org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseBasicArrayListCache';

our $instance = 'org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathCacheFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{maxConcurrentPaths} = 0;
    $self->{maxPaths} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapExtractedPathCacheFactory::instance;
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


sub getPath {
    my ($self) = @_;
        if ($self->{list}->size() > 0) {
            return $self->{list}->removeAt(0);
        } else {
            return 'org::allbinary::util::BasicArrayListS'->new($self->{maxPaths});
        }
}


sub release {
    my ($self, $list) = @_;
        $list->clear();
        $self->{list}->add($list);
}

use org::allbinary::logic::util::cache::BaseBasicArrayListCache;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListS;

1;


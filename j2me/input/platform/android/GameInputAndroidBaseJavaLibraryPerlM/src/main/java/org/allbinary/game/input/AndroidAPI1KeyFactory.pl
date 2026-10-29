# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidAPI1KeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::AndroidKeyFactory';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::AndroidAPI1KeyFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::AndroidAPI1KeyFactory::instance = 'org::allbinary::game::input::AndroidAPI1KeyFactory'->new();
        }
        return $org::allbinary::game::input::AndroidAPI1KeyFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::AndroidKeyFactory;

1;


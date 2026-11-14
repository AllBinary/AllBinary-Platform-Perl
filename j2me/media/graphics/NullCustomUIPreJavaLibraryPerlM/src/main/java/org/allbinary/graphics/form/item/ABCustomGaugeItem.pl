# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABCustomGaugeItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomItem';

tie our $NULL_GAUGE_ITEM, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::form::item::ABCustomGaugeItem'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 1, 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}) };


sub new {
    my ($class, $label, $maxValue, $initialValue, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::color::BasicColorFactory ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::graphics::form::item::ABCustomItem ();

1;


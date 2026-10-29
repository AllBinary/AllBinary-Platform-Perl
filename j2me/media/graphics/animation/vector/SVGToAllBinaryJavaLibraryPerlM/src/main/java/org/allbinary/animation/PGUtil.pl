# Generated Code Do Not Modify

package org::allbinary::animation::PGUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::PGUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::PGUtil::instance;
}


sub flattenCubicBezier {
    my ($self, $x0, $y0, $x1, $y1, $x2, $y2, $x3, $y3, $outX, $outY, $count, $maxPoints) = @_;
        my $fixedPoint = 'org::allbinary::animation::FixedPoint'->getInstance();
        my $steps = 10;
        for (my $i = 1; $i <= $steps; $i++) {
            my $t = $fixedPoint->div($fixedPoint->toFixed($i), $fixedPoint->toFixed($steps));
            my $mt = $fixedPoint->{ONE} - $t;
            my $mt3 = $fixedPoint->mul($fixedPoint->mul($mt, $mt), $mt);
            my $mt2t3 = 3 * $fixedPoint->mul($fixedPoint->mul($mt, $mt), $t);
            my $mtt23 = 3 * $fixedPoint->mul($fixedPoint->mul($mt, $t), $t);
            my $t3 = $fixedPoint->mul($fixedPoint->mul($t, $t), $t);
            my $x = $fixedPoint->mul($mt3, $x0) + $fixedPoint->mul($mt2t3, $x1) + $fixedPoint->mul($mtt23, $x2) + $fixedPoint->mul($t3, $x3);
            my $y = $fixedPoint->mul($mt3, $y0) + $fixedPoint->mul($mt2t3, $y1) + $fixedPoint->mul($mtt23, $y2) + $fixedPoint->mul($t3, $y3);
            if ($count->[0] < $maxPoints) {
                $outX->[$count->[0]] = $x;
                $outY->[$count->[0]] = $y;
                $count->[0]++;
            }
        }
}

use org::allbinary::animation::FixedPoint;

1;


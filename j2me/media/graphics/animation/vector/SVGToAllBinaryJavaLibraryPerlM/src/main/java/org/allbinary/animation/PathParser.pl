# Generated Code Do Not Modify

package org::allbinary::animation::PathParser;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub tokenize {
    my ($class, $d) = @_;
        my $tokens = 'org::allbinary::util::BasicArrayListD'->new();
        my $sb = "";
        for (my $i = 0; $i < length($d); $i++) {
            my $c = substr($d, $i, 1);
            if ($c eq " " || $c eq "," || $c eq "\t" || $c eq "\n" || $c eq "\r") {
                if ($sb->length() > 0) {
                    $tokens->add($sb->toString());
                    $sb->setLength(0);
                }
            } elsif ($c eq "M" || $c eq "m" || $c eq "L" || $c eq "l" || $c eq "V" || $c eq "v" || $c eq "C" || $c eq "c" || $c eq "Z" || $c eq "z") {
                if ($sb->length() > 0) {
                    $tokens->add($sb->toString());
                    $sb->setLength(0);
                }
                $tokens->add(("" . ($c)));
            } else {
                $sb->append($c);
            }
        }
        if ($sb->length() > 0) {
            $tokens->add($sb->toString());
        }
        my $res = [(undef) x ($tokens->size())];
        $tokens->toArrayType($res);
        return $res;
}


sub parsePath {
    my ($class, $d, $outX, $outY, $maxPoints) = @_;
        my $tokens = __PACKAGE__->tokenize($d);
        my $count = [0];
        my $fixedPoint = 'org::allbinary::animation::FixedPoint'->getInstance();
        my $curX = 0;
        my $curY = 0;
        my $startX = 0;
        my $startY = 0;
        my $idx = 0;
        while ($idx < scalar(@{$tokens})) {
            my $tok = $tokens->[$idx++];
            my $cmd = substr($tok, 0, 1);
            if ($cmd eq "M" || $cmd eq "m") {
                my $x = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $y = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                if ($cmd eq "m") {
                    $x += $curX;
                    $y += $curY;
                }
                $curX = $x;
                $curY = $y;
                $startX = $x;
                $startY = $y;
                $outX->[$count->[0]] = $curX;
                $outY->[$count->[0]] = $curY;
                $count->[0]++;
            } elsif ($cmd eq "L" || $cmd eq "l") {
                my $x = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $y = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                if ($cmd eq "l") {
                    $x += $curX;
                    $y += $curY;
                }
                $curX = $x;
                $curY = $y;
                $outX->[$count->[0]] = $curX;
                $outY->[$count->[0]] = $curY;
                $count->[0]++;
            } elsif ($cmd eq "V" || $cmd eq "v") {
                my $y = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                if ($cmd eq "v") {
                    $y += $curY;
                }
                $curY = $y;
                $outX->[$count->[0]] = $curX;
                $outY->[$count->[0]] = $curY;
                $count->[0]++;
            } elsif ($cmd eq "C" || $cmd eq "c") {
                my $x1 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $y1 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $x2 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $y2 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $x3 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                my $y3 = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                if ($cmd eq "c") {
                    $x1 += $curX;
                    $y1 += $curY;
                    $x2 += $curX;
                    $y2 += $curY;
                    $x3 += $curX;
                    $y3 += $curY;
                }
                'org::allbinary::animation::PGUtil'->getInstance()->flattenCubicBezier($curX, $curY, $x1, $y1, $x2, $y2, $x3, $y3, $outX, $outY, $count, $maxPoints);
                $curX = $x3;
                $curY = $y3;
            } elsif ($cmd eq "Z" || $cmd eq "z") {
                $curX = $startX;
                $curY = $startY;
                $outX->[$count->[0]] = $curX;
                $outY->[$count->[0]] = $curY;
                $count->[0]++;
            }
            while ($idx < scalar(@{$tokens}) && !__PACKAGE__->isCommand($tokens->[$idx])) {
                if ($cmd eq "M" || $cmd eq "m" || $cmd eq "L" || $cmd eq "l") {
                    my $x = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                    my $y = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                    if ($cmd eq "m" || $cmd eq "l") {
                        $x += $curX;
                        $y += $curY;
                    }
                    $curX = $x;
                    $curY = $y;
                    $outX->[$count->[0]] = $curX;
                    $outY->[$count->[0]] = $curY;
                    $count->[0]++;
                } elsif ($cmd eq "V" || $cmd eq "v") {
                    my $y = $fixedPoint->toFixed(($tokens->[$idx++] + 0));
                    if ($cmd eq "v") {
                        $y += $curY;
                    }
                    $curY = $y;
                    $outX->[$count->[0]] = $curX;
                    $outY->[$count->[0]] = $curY;
                    $count->[0]++;
                }
            }
        }
        return $count->[0];
}


sub isCommand {
    my ($class, $tok) = @_;
        my $c = substr($tok, 0, 1);
        return index("MmLlVvCcZz", $c) >= 0;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::animation::FixedPoint;
use org::allbinary::animation::PGUtil;

1;


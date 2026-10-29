# Generated Code Do Not Modify

package org::allbinary::animation::PolygonRasterizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::PolygonRasterizer'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::PolygonRasterizer::instance;
}


sub getPixelBuffer {
    my ($self, $svgPath, $pathX, $pathY, $pixelBuffer, $width, $height) = @_;
        my $pointCount = 'org::allbinary::animation::PathParser'->parsePath($svgPath, $pathX, $pathY, scalar(@{$pathX}));
        for (my $i = 0; $i < scalar(@{$pixelBuffer}); $i++) {
            $pixelBuffer->[$i] = 0xFFFFFFFF;
        }
        'org::allbinary::animation::PolygonRasterizer'->getInstance()->fillPolygon($pathX, $pathY, $pointCount, $pixelBuffer, $width, $height, 0xFFFF00FF);
        return $pixelBuffer;
}


sub fillPolygon {
    my ($self, $polyX, $polyY, $numPoints, $buffer, $width, $height, $colorRGB) = @_;
        if ($numPoints < 3) {
            return;
        }
        my $fixedPoint = 'org::allbinary::animation::FixedPoint'->getInstance();
        my $x = [(0) x ($numPoints)];
        my $y = [(0) x ($numPoints)];
        my $minY = $height;
        my $maxY = 0;
        for (my $i = 0; $i < $numPoints; $i++) {
            $x->[$i] = $fixedPoint->toInt($polyX->[$i]);
            $y->[$i] = $fixedPoint->toInt($polyY->[$i]);
            if ($y->[$i] < $minY) {
                $minY = $y->[$i];
            }
            if ($y->[$i] > $maxY) {
                $maxY = $y->[$i];
            }
        }
        if ($minY < 0) {
            $minY = 0;
        }
        if ($maxY >= $height) {
            $maxY = $height - 1;
        }
        my $scanlineX = [(0) x ($numPoints)];
        for (my $scanY = $minY; $scanY <= $maxY; $scanY++) {
            my $intersectCount = 0;
            for (my $i = 0; $i < $numPoints; $i++) {
                my $next = ($i + 1) % $numPoints;
                my $x1 = $x->[$i];
                my $y1 = $y->[$i];
                my $x2 = $x->[$next];
                my $y2 = $y->[$next];
                if (($y1 < $scanY && $y2 >= $scanY) || ($y2 < $scanY && $y1 >= $scanY)) {
                    if ($y2 != $y1) {
                        my $interX = $x1 + int(($scanY - $y1) * ($x2 - $x1) / ($y2 - $y1));
                        $scanlineX->[$intersectCount++] = $interX;
                    }
                }
            }
            for (my $i = 0; $i < $intersectCount - 1; $i++) {
                for (my $j = $i + 1; $j < $intersectCount; $j++) {
                    if ($scanlineX->[$i] > $scanlineX->[$j]) {
                        my $temp = $scanlineX->[$i];
                        $scanlineX->[$i] = $scanlineX->[$j];
                        $scanlineX->[$j] = $temp;
                    }
                }
            }
            for (my $i = 0; $i < $intersectCount; $i += 2) {
                if ($i + 1 >= $intersectCount) {
                    last;
                }
                my $startX = $scanlineX->[$i];
                my $endX = $scanlineX->[$i + 1];
                if ($startX < 0) {
                    $startX = 0;
                }
                if ($endX >= $width) {
                    $endX = $width - 1;
                }
                my $rowOffset = $scanY * $width;
                for (my $pixelX = $startX; $pixelX <= $endX; $pixelX++) {
                    $buffer->[$rowOffset + $pixelX] = $colorRGB;
                }
            }
        }
}


sub main {
    my ($self, $args) = @_;
        my $width = 100;
        my $height = 100;
        my $pathX = [(0) x (200)];
        my $pathY = [(0) x (200)];
        my $pixelBuffer = [(0) x ($width * $height)];
        my $svgPath = "M 32.139812,81.554575 14.450128,74.294372 V 50.000034 25.705697 l 17.73231,-7.268329 C 41.935209,14.439788 49.953112,11.168898 50,11.168723 c 0.04689,-1.74e-4 8.064791,3.270238 17.817562,7.267583 l 17.73231,7.267899 V 50 74.295795 l -17.73231,7.2679 c -9.752771,3.997344 -17.789855,7.264116 -17.860188,7.259492 -0.07033,-0.0046 -8.088235,-3.275499 -17.817562,-7.268612 z";
        'org::allbinary::animation::PolygonRasterizer'->getInstance()->getPixelBuffer($svgPath, $pathX, $pathY, $pixelBuffer, $width, $height);
}

use org::allbinary::animation::PathParser;
use org::allbinary::animation::FixedPoint;

1;


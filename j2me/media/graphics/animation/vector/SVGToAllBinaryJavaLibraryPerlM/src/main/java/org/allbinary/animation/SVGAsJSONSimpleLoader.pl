#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::animation::SVGAsJSONSimpleLoader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use Scalar::Util ();

our $instance = 'org::allbinary::animation::SVGAsJSONSimpleLoader'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{graphicsStrings} = 'org::allbinary::graphics::GraphicsStrings'->getInstance();
    $self->{shapeTypeFactory} = 'org::allbinary::animation::ShapeTypeFactory'->getInstance();
    $self->{KEY_SVG} = "svg";
    $self->{KEY_X1} = "x1";
    $self->{KEY_Y1} = "y1";
    $self->{KEY_X2} = "x2";
    $self->{KEY_Y2} = "y2";
    $self->{KEY_CX} = "cx";
    $self->{KEY_CY} = "cy";
    $self->{KEY_R} = "r";
    $self->{KEY_X} = 'org::allbinary::math::PositionStrings'->getInstance()->{X};
    $self->{KEY_Y} = 'org::allbinary::math::PositionStrings'->getInstance()->{Y};
    $self->{ERROR_PARSE_SVG_JSON} = "Unable to parse SVG JSON";
    $self->{ERROR_MISSING_KEY_PREFIX} = "Missing key: ";
    $self->{ERROR_INVALID_NUMBER_PREFIX} = "Invalid number for key: ";
    $self->{ERROR_EXPECTED_OBJECT_PREFIX} = "Expected object for: ";
    $self->{EMPTY_POINTS} = 'org::allbinary::logic::math::PrimitiveIntUtil'->getTwoDimensionalArrayInstance();
    $self->{SHAPE_SEPARATOR} = [1000, 1000];
    $self->{CIRCLE_SEGMENTS} = 16;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::SVGAsJSONSimpleLoader::instance;
}


# throws Exception
sub load {
    my ($self, $svgAsJson) = @_;
        if (!defined($svgAsJson)) {
            return $self->{EMPTY_POINTS};
        }
        try {
            my $root = 'org::json::me::JSONObject'->new($svgAsJson);
            my $svgValue = $root->opt($self->{KEY_SVG});
            my $svg = (!defined($svgValue) ? $root : $self->asObject($svgValue, $self->{KEY_SVG}));
            my $pointVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $keys = $svg->keys();
            while ($keys->hasMoreElements()) {
                my $key = $keys->nextElement();
                my $value = $svg->opt($key);
                if ($self->{shapeTypeFactory}->{KEY_LINE}->equals($key)) {
                    $self->addShapes($pointVector, $value, $self->{shapeTypeFactory}->{LINE});
                } elsif ($self->{shapeTypeFactory}->equals($key)) {
                    $self->addShapes($pointVector, $value, $self->{shapeTypeFactory}->{CIRCLE});
                } elsif ($self->{shapeTypeFactory}->{KEY_RECT}->equals($key) || $self->{shapeTypeFactory}->{KEY_RECTANGLE}->equals($key)) {
                    $self->addShapes($pointVector, $value, $self->{shapeTypeFactory}->{RECTANGLE});
                }
            }
            return $self->toPoints($pointVector);
        } catch ($e) {
            die ($self->{ERROR_PARSE_SVG_JSON}, $e);
        }
}


# throws Exception
sub addShapes {
    my ($self, $pointVector, $value, $shapeType) = @_;
        if ((Scalar::Util::blessed($value) && $value->isa('org::json::me::JSONArray'))) {
            my $array = $value;
            my $size = $array->length();
            for (my $index = 0; $index < $size; $index++) {
                $self->addShape($pointVector, $array->opt($index), $shapeType);
            }
        } else {
            $self->addShape($pointVector, $value, $shapeType);
        }
}


# throws Exception
sub addShape {
    my ($self, $pointVector, $value, $shapeType) = @_;
        my $shape = $self->asObject($value, $shapeType->getName());
        if ($shapeType == $self->{shapeTypeFactory}->{LINE}) {
            $self->addLine($pointVector, $shape);
        } elsif ($shapeType == $self->{shapeTypeFactory}->{CIRCLE}) {
            $self->addCircle($pointVector, $shape);
        } else {
            $self->addRectangle($pointVector, $shape);
        }
}


# throws Exception
sub addLine {
    my ($self, $pointVector, $line) = @_;
        $self->addPoint($pointVector, $self->readInt($line, $self->{KEY_X1}), $self->readInt($line, $self->{KEY_Y1}));
        $self->addPoint($pointVector, $self->readInt($line, $self->{KEY_X2}), $self->readInt($line, $self->{KEY_Y2}));
        $self->addSeparator($pointVector);
}


# throws Exception
sub addCircle {
    my ($self, $pointVector, $circle) = @_;
        my $cx = $self->readInt($circle, $self->{KEY_CX});
        my $cy = $self->readInt($circle, $self->{KEY_CY});
        my $radius = $self->readInt($circle, $self->{KEY_R});
        for (my $index = 0; $index <= $self->{CIRCLE_SEGMENTS}; $index++) {
            my $angle = ($Math::PI * 2.0 * $index) / $self->{CIRCLE_SEGMENTS};
            my $x = int(POSIX::floor($cx + (cos($angle) * $radius) + 0.5));
            my $y = int(POSIX::floor($cy + (sin($angle) * $radius) + 0.5));
            $self->addPoint($pointVector, $x, $y);
        }
        $self->addSeparator($pointVector);
}


# throws Exception
sub addRectangle {
    my ($self, $pointVector, $rectangle) = @_;
        my $x = $self->readInt($rectangle, $self->{KEY_X}, 0);
        my $y = $self->readInt($rectangle, $self->{KEY_Y}, 0);
        my $width = $self->readInt($rectangle, $self->{graphicsStrings}->{WIDTH});
        my $height = $self->readInt($rectangle, $self->{graphicsStrings}->{HEIGHT});
        $self->addPoint($pointVector, $x, $y);
        $self->addPoint($pointVector, $x + $width, $y);
        $self->addPoint($pointVector, $x + $width, $y + $height);
        $self->addPoint($pointVector, $x, $y + $height);
        $self->addPoint($pointVector, $x, $y);
        $self->addSeparator($pointVector);
}


sub addPoint {
    my ($self, $pointVector, $x, $y) = @_;
        $pointVector->add([$x, $y]);
}


sub addSeparator {
    my ($self, $pointVector) = @_;
        $pointVector->add([$self->{SHAPE_SEPARATOR}->[0], $self->{SHAPE_SEPARATOR}->[1]]);
}


# throws Exception
sub readInt {
    my ($self, $anyType, $key) = @_;
        my $value = $anyType->get($key);
        if (!defined($value)) {
            die ($self->{ERROR_MISSING_KEY_PREFIX} . $key);
        }
        return $self->toInt($value, $key);
}


# Java overloaded method: Perl keeps the last definition
sub readInt {
    my ($self, $anyType, $key, $defaultValue) = @_;
        try {
            if ($anyType->has($key)) {
                my $value = $anyType->get($key);
                return $self->toInt($value, $key);
            }
        } catch ($e) {
            print(STDERR $e, "\n");
        }
        return $defaultValue;
}


sub toInt {
    my ($self, $value, $key) = @_;
        if ((Scalar::Util::blessed($value) && $value->isa('org::allbinary::animation::Number'))) {
            return int(POSIX::floor(($value) + 0.5));
        }
        if ((Scalar::Util::blessed($value) && $value->isa('String'))) {
            return int(POSIX::floor(($value + 0) + 0.5));
        }
        die ($self->{ERROR_INVALID_NUMBER_PREFIX} . $key);
}


sub asObject {
    my ($self, $value, $name) = @_;
        if ((Scalar::Util::blessed($value) && $value->isa('org::json::me::JSONObject'))) {
            return $value;
        }
        die ($self->{ERROR_EXPECTED_OBJECT_PREFIX} . $name);
}


sub toPoints {
    my ($self, $pointVector) = @_;
        if ($pointVector->size() == 0) {
            return $self->{EMPTY_POINTS};
        }
        my $points = [map { [(0) x (2)] } 1 .. ($pointVector->size())];
        for (my $index = 0; $index < $pointVector->size(); $index++) {
            my $point = $pointVector->get($index);
            $points->[$index] = $point;
        }
        return $points;
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        my $svgAsJson = "{\"svg\": {\n" . "    \"rect\": {\n" . "        \"width\": 20,\n" . "        \"fill\": \"#008c00\",\n" . "        \"height\": 20\n" . "    },\n" . "    \"xmlns\": \"http://www.w3.org/2000/svg\",\n" . "    \"width\": 20,\n" . "    \"height\": 20\n" . "}}\n";
        my $points = 'org::allbinary::animation::SVGAsJSONSimpleLoader'->getInstance()->load($svgAsJson);
        my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = scalar(@{$points});
        for (my $index = 0; $index < $size; $index++) {
            my $size2 = scalar(@{$points->[$index]});
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                $stringBuilder->appendint(int($points->[$index]->[$index2]));
                $stringBuilder->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA});
            }
        }
        print($stringBuilder->toString(), "\n");
}

use java::util::Enumeration;
use org::allbinary::graphics::GraphicsStrings;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::json::me::JSONArray;
use org::json::me::JSONException;
use org::json::me::JSONObject;
use org::allbinary::animation::ShapeTypeFactory;
use java::lang::System;

1;


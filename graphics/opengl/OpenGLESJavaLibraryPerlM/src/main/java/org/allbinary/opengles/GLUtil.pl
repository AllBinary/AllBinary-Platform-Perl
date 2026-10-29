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

package org::allbinary::opengles::GLUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();

our $instance = 'org::allbinary::opengles::GLUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{BYTES_PER_FLOAT} = 4;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::opengles::GLUtil::instance;
}


sub makeFloatBuffer3 {
    my ($self, $p_a, $p_b, $p_c) = @_;
        my $b = 'java::nio::ByteBuffer'->allocateDirect(3 * $self->{BYTES_PER_FLOAT});
        $b->order('java::nio::ByteOrder'->nativeOrder());
        my $buffer = $b->asFloatBuffer();
        $buffer->put($p_a);
        $buffer->put($p_b);
        $buffer->put($p_c);
        $self->position($buffer, 0);
        return $buffer;
}


sub makeFloatBuffer4 {
    my ($self, $p_a, $p_b, $p_c, $p_d) = @_;
        my $b = 'java::nio::ByteBuffer'->allocateDirect(4 * $self->{BYTES_PER_FLOAT});
        $b->order('java::nio::ByteOrder'->nativeOrder());
        my $buffer = $b->asFloatBuffer();
        $buffer->put($p_a);
        $buffer->put($p_b);
        $buffer->put($p_c);
        $buffer->put($p_d);
        $self->position($buffer, 0);
        return $buffer;
}


sub makeFloatBuffer {
    my ($self, $byteBuffer) = @_;
        my $b = 'java::nio::ByteBuffer'->allocateDirect($byteBuffer->limit() * $self->{BYTES_PER_FLOAT});
        $b->order('java::nio::ByteOrder'->nativeOrder());
        my $buffer = $b->asFloatBuffer();
        my $unsigned = 0;
        my $v = 0.0;
        while ($byteBuffer->hasRemaining()) {
            $unsigned = $byteBuffer->get() & 0xFF;
            $v = ($unsigned) / 255;
            $buffer->put($v);
        }
        $self->position($buffer, 0);
        return $buffer;
}


sub position {
    my ($self, $buffer, $newPosition) = @_;
        return $buffer->position($newPosition);
}


sub rotateUVs {
    my ($self, $uvs, $angleDegrees, $pivotU, $pivotV) = @_;
        my $angleRad = (($angleDegrees) * 3.14159265358979 / 180);
        my $cosA = cos($angleRad);
        my $sinA = sin($angleRad);
        for (my $i = 0; $i < scalar(@{$uvs}); $i += 2) {
            my $u = $uvs->[$i];
            my $v = $uvs->[$i + 1];
            my $du = $u - $pivotU;
            my $dv = $v - $pivotV;
            my $ru = ($du * $cosA - $dv * $sinA) + $pivotU;
            my $rv = ($du * $sinA + $dv * $cosA) + $pivotV;
            $uvs->[$i] = $ru;
            $uvs->[$i + 1] = $rv;
        }
}

# use java::nio::Buffer;
# use java::nio::ByteBuffer;
# use java::nio::ByteOrder;
# use java::nio::FloatBuffer;

1;


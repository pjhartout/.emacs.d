#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""test_filename.py

***file description***

"""

import pytest

test_data = [(in1, in2, expected)]


@pytest.mark.parametrize("in1, in2, expected", test_data)
def test_sample_func(in1, in2, expected):
    """test sample func"""
    assert sample_func(in1, in2) == expected

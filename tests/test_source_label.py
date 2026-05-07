"""Test source label enforcer."""

from consulting_os.source_label import detect_bare_numbers, parse_labels


def test_bare_number_detected():
    text = "市場規模は 100 億円。"
    bare = detect_bare_numbers(text)
    assert len(bare) == 1


def test_number_with_inference_label_passes():
    text = "市場規模は 100 億円 (INFERENCE: 公開情報より推定)。"
    bare = detect_bare_numbers(text)
    assert len(bare) == 0


def test_number_with_source_url_passes():
    text = "市場規模は 100 億円 出典: <a href='https://example.com'>調査</a>"
    bare = detect_bare_numbers(text)
    assert len(bare) == 0


def test_parse_labels_extracts_all():
    text = """
1500 億円市場 FACT 出典あり
推定 30% INFERENCE
将来 50% SPECULATION
"""
    labels = parse_labels(text)
    assert len(labels.facts) == 1
    assert len(labels.inferences) == 1
    assert len(labels.speculations) == 1

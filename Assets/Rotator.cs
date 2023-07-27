using UnityEngine;

public class Rotator : MonoBehaviour
{
    [SerializeField]
    private Transform m_Target = null;
    [SerializeField]
    private float m_Speed = 1.0f;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        m_Target.rotation *= Quaternion.Euler(0f, Time.deltaTime * m_Speed, 0f);
    }
}
